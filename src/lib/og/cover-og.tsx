import { ImageResponse } from "next/og";

export const OG_SIZE = { width: 1200, height: 630 };
export const OG_CONTENT_TYPE = "image/png";

// Pull a TTF from Google Fonts (old UA forces truetype, which Satori needs).
async function loadFont(family: string, weight: number, text: string) {
  const url = `https://fonts.googleapis.com/css2?family=${family}:wght@${weight}&text=${encodeURIComponent(text)}`;
  const css = await (
    await fetch(url, { headers: { "User-Agent": "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)" } })
  ).text();
  const m = css.match(/src: url\((.+?)\) format/);
  if (!m) throw new Error("font src not found");
  return (await fetch(m[1])).arrayBuffer();
}

type OgInput = {
  h1: string;
  bookTitle: string;
  author: string;
  coverUrl?: string | null;
  category?: string | null;
};

const INK = "#16130E";
const PAPER = "#F7F3EC";
const SAFFRON = "#F4A300";
const MUTED = "#6B6358";

export async function renderCoverOg({ h1, bookTitle, author, coverUrl, category }: OgInput) {
  const text =
    h1 + bookTitle + author + (category ?? "") + "ResafyPelajaran dari resafy.id“";
  let fonts;
  try {
    const [serif, sans] = await Promise.all([
      loadFont("Fraunces", 600, text),
      loadFont("Plus+Jakarta+Sans", 600, text),
    ]);
    fonts = [
      { name: "Fraunces", data: serif, weight: 600 as const, style: "normal" as const },
      { name: "Jakarta", data: sans, weight: 600 as const, style: "normal" as const },
    ];
  } catch {
    fonts = undefined; // degrade to Satori default rather than 500
  }

  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          backgroundColor: PAPER,
          padding: 64,
          fontFamily: "Jakarta, sans-serif",
        }}
      >
        {/* Cover */}
        <div style={{ display: "flex", width: 320, flexShrink: 0 }}>
          {coverUrl ? (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={coverUrl}
              width={320}
              height={480}
              style={{
                width: 320,
                height: 480,
                objectFit: "cover",
                borderRadius: 14,
                boxShadow: "0 24px 60px -20px rgba(22,19,14,0.55)",
              }}
              alt=""
            />
          ) : (
            <div
              style={{
                width: 320,
                height: 480,
                display: "flex",
                flexDirection: "column",
                justifyContent: "space-between",
                backgroundColor: INK,
                color: PAPER,
                borderRadius: 14,
                padding: 28,
              }}
            >
              <span style={{ color: SAFFRON, fontSize: 64, fontFamily: "Fraunces, serif" }}>&ldquo;</span>
              <span style={{ fontSize: 34, fontFamily: "Fraunces, serif", lineHeight: 1.1 }}>{bookTitle}</span>
            </div>
          )}
        </div>

        {/* Text panel */}
        <div
          style={{
            display: "flex",
            flexDirection: "column",
            justifyContent: "center",
            marginLeft: 56,
            flex: 1,
          }}
        >
          {category && (
            <div style={{ display: "flex" }}>
              <span
                style={{
                  backgroundColor: SAFFRON,
                  color: INK,
                  fontSize: 22,
                  fontWeight: 600,
                  padding: "8px 18px",
                  borderRadius: 999,
                }}
              >
                {category}
              </span>
            </div>
          )}
          <div
            style={{
              display: "flex",
              fontFamily: "Fraunces, serif",
              fontSize: 60,
              lineHeight: 1.05,
              color: INK,
              marginTop: 26,
              letterSpacing: "-0.02em",
            }}
          >
            {h1}
          </div>
          <div style={{ display: "flex", fontSize: 26, color: MUTED, marginTop: 24 }}>
            Pelajaran dari {bookTitle} — {author}
          </div>
          <div style={{ display: "flex", alignItems: "center", marginTop: 40 }}>
            <span style={{ color: SAFFRON, fontFamily: "Fraunces, serif", fontSize: 34 }}>&ldquo;</span>
            <span style={{ fontSize: 28, fontWeight: 600, color: INK, marginLeft: 8 }}>resafy</span>
            <span style={{ color: SAFFRON, fontSize: 30, marginLeft: 2 }}>.</span>
            <span style={{ fontSize: 20, color: MUTED, marginLeft: 16 }}>Serap ilmunya, skip tebelnya</span>
          </div>
        </div>
      </div>
    ),
    { ...OG_SIZE, fonts },
  );
}
