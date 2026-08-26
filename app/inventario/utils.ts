/**
 * Sanitizes and parses numeric input from users that might contain:
 * - Leading zeros: "05" -> 5, "007" -> 7
 * - Commas instead of dots: "7,2" -> 7.2
 * - Double dots or accidental "0." prefix before another decimal: "0.7.2" -> 7.2
 * - Consecutive dots: "0..5" -> 0.5
 */
export function sanitizeNumeric(val: string | number | null | undefined): number {
  if (val === null || val === undefined || val === "") return 0;
  if (typeof val === "number") return isNaN(val) ? 0 : val;

  let str = String(val).trim().replace(/,/g, ".");
  str = str.replace(/\s+/g, "");

  // If string has multiple dots like "0.7.2"
  const dotParts = str.split(".");
  if (dotParts.length > 2) {
    if (dotParts[0] === "0" && dotParts.length === 3 && dotParts[1] !== "") {
      str = dotParts[1] + "." + dotParts[2];
    } else {
      str = dotParts[0] + "." + dotParts.slice(1).join("");
    }
  }

  const num = parseFloat(str);
  return isNaN(num) ? 0 : num;
}

export function cleanNumberDisplay(val: string | number | null | undefined): string {
  if (val === null || val === undefined || val === "") return "";
  if (typeof val === "number") return String(val);
  const str = String(val).trim().replace(/,/g, ".");
  if (str === "" || str === "0") return "0";
  if (str.endsWith(".")) return str;
  const num = sanitizeNumeric(str);
  return isNaN(num) ? "" : String(num);
}
