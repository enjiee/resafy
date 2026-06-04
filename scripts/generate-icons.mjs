// Generates PWA PNG icons from the Resafy brand mark.
// Run: node scripts/generate-icons.mjs
import sharp from "sharp";
import { mkdirSync } from "node:fs";

mkdirSync("public/icons", { recursive: true });

// Master icon at 512: navy rounded square + distillation mark (warm white)
// + essence dot (Sunset Orange). Mark sits in the central safe zone so the
// same art works as a maskable icon.
const masterSvg = `
<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <rect width="512" height="512" rx="112" fill="#1A1A2E"/>
  <rect x="112" y="136" width="288" height="44.8" rx="22.4" fill="#FFF8F0"/>
  <rect x="160" y="224" width="192" height="44.8" rx="22.4" fill="#FFF8F0"/>
  <rect x="200" y="312" width="112" height="44.8" rx="22.4" fill="#FFF8F0"/>
  <circle cx="256" cy="409.6" r="35.2" fill="#FF6B35"/>
</svg>`;

const buf = Buffer.from(masterSvg);

const targets = [
  { size: 192, out: "public/icons/icon-192.png" },
  { size: 512, out: "public/icons/icon-512.png" },
  { size: 512, out: "public/icons/icon-maskable-512.png" },
  { size: 180, out: "src/app/apple-icon.png" },
];

for (const t of targets) {
  await sharp(buf).resize(t.size, t.size).png().toFile(t.out);
  console.log(`✓ ${t.out} (${t.size}x${t.size})`);
}
console.log("Done.");
