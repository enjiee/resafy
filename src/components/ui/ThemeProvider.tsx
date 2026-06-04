"use client";

import { useCallback, useEffect, useSyncExternalStore } from "react";

type ThemeMode = "auto" | "light" | "dark";
type ResolvedTheme = "light" | "dark";

const STORAGE_KEY = "resafy-theme";
const DARK_START_HOUR = 20; // 20:00
const DARK_END_HOUR = 6; //   06:00

/* ---- tiny external store (localStorage + DOM class) ---- */

const listeners = new Set<() => void>();
function emit() {
  listeners.forEach((l) => l());
}
function subscribe(cb: () => void) {
  listeners.add(cb);
  window.addEventListener("storage", cb);
  return () => {
    listeners.delete(cb);
    window.removeEventListener("storage", cb);
  };
}

function isDarkHour(hour: number): boolean {
  return hour >= DARK_START_HOUR || hour < DARK_END_HOUR;
}

function getStoredMode(): ThemeMode {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (raw === "light" || raw === "dark" || raw === "auto") return raw;
  } catch {
    /* blocked — default auto */
  }
  return "auto";
}

function resolveMode(mode: ThemeMode): ResolvedTheme {
  if (mode === "auto") {
    return isDarkHour(new Date().getHours()) ? "dark" : "light";
  }
  return mode;
}

function applyDom(resolved: ResolvedTheme) {
  document.documentElement.classList.toggle("dark", resolved === "dark");
}

// Snapshots — read straight from the source of truth.
function getModeSnapshot(): ThemeMode {
  return getStoredMode();
}
function getResolvedSnapshot(): ResolvedTheme {
  if (
    typeof document !== "undefined" &&
    document.documentElement.classList.contains("dark")
  ) {
    return "dark";
  }
  return "light";
}
const getServerMode = (): ThemeMode => "auto";
const getServerResolved = (): ResolvedTheme => "light";

/**
 * Mounts the auto-mode ticker so the theme flips live at 20:00 / 06:00.
 * No state here — the DOM class (set pre-hydration by themeInitScript) is the
 * source of truth, read via useSyncExternalStore in useTheme().
 */
export function ThemeProvider({ children }: { children: React.ReactNode }) {
  useEffect(() => {
    function tick() {
      if (getStoredMode() !== "auto") return;
      applyDom(resolveMode("auto"));
      emit();
    }
    tick(); // re-sync on mount (hour may have changed since script ran)
    const id = setInterval(tick, 60_000);
    return () => clearInterval(id);
  }, []);

  return <>{children}</>;
}

export function useTheme() {
  const theme = useSyncExternalStore(
    subscribe,
    getModeSnapshot,
    getServerMode,
  );
  const resolvedTheme = useSyncExternalStore(
    subscribe,
    getResolvedSnapshot,
    getServerResolved,
  );

  const setTheme = useCallback((mode: ThemeMode) => {
    try {
      localStorage.setItem(STORAGE_KEY, mode);
    } catch {
      /* ignore */
    }
    applyDom(resolveMode(mode));
    emit();
  }, []);

  const toggle = useCallback(() => {
    setTheme(getResolvedSnapshot() === "dark" ? "light" : "dark");
  }, [setTheme]);

  return { theme, resolvedTheme, setTheme, toggle };
}

/**
 * Inline script injected before hydration to prevent flash of wrong theme.
 * Mirrors resolveMode() above.
 */
export const themeInitScript = `
(function(){
  try{
    var t = localStorage.getItem("${STORAGE_KEY}");
    var h = new Date().getHours();
    var dark = t === "dark" || ((t === "auto" || !t) && (h >= ${DARK_START_HOUR} || h < ${DARK_END_HOUR}));
    if(dark) document.documentElement.classList.add("dark");
  }catch(e){}
})();
`;
