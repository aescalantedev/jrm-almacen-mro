import type { Metadata, Viewport } from "next";
import { Plus_Jakarta_Sans } from "next/font/google";
import { cookies } from "next/headers";
import "./globals.css";
import { ThemeProvider } from "@/components/theme-provider";
import { AppShell } from "@/components/AppShell";

const fontSans = Plus_Jakarta_Sans({
  subsets: ["latin"],
  variable: "--font-sans",
});

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1,
  maximumScale: 1,
  userScalable: false,
  viewportFit: "cover",
  themeColor: "#0f172a",
};

export const metadata: Metadata = {
  title: "MRO Inventario — ALM MRO CHILCA",
  description: "Sistema de Inventario MRO para bodega ALM MRO CHILCA",
  manifest: "/manifest.json",
  other: {
    "mobile-web-app-capable": "yes",
  },
};

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const cookieStore = await cookies();
  const colorTheme = cookieStore.get("strix-color-theme")?.value || "sap";

  return (
    <html lang="es" data-color-theme={colorTheme} suppressHydrationWarning>
      <body suppressHydrationWarning className={`${fontSans.variable} font-sans antialiased selection:bg-primary/10 selection:text-primary min-h-screen bg-background`}>
        <ThemeProvider attribute="class" defaultTheme="light" enableSystem={false}>
          <AppShell>{children}</AppShell>
        </ThemeProvider>
      </body>
    </html>
  );
}
