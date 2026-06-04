// Generates PWA PNG icons from the Resafy brand mark (Logo B — Quote-Sari).
// Run: node scripts/generate-icons.mjs
import sharp from "sharp";
import { mkdirSync } from "node:fs";

mkdirSync("public/icons", { recursive: true });

// Master 512: saffron rounded tile + ink quote-drops (Symbol B), centered in
// the safe zone so the same art works as a maskable icon.
// Transform centers the 32-space symbol at (256,256) of the 512 tile.
const masterSvg = `
<svg width="512" height="512" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
  <rect width="512" height="512" rx="112" fill="#F4A300"/>
  <g transform="translate(256 256) scale(13.1) translate(-17.5 -9.65)" fill="#16130E">
    <path d="M11.6 7.5a4.4 4.4 0 1 1-4.4 4.4c0-3.7 2.2-6.6 6-8.2l1.1 2.2c-1.8.8-2.9 1.9-3.3 3.2.2-.1.4-.1.6-.1Z"/>
    <path d="M23.5 7.5a4.4 4.4 0 1 1-4.4 4.4c0-3.7 2.2-6.6 6-8.2l1.1 2.2c-1.8.8-2.9 1.9-3.3 3.2.2-.1.4-.1.6-.1Z"/>
  </g>
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
