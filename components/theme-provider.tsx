"use client"

import * as React from "react"
import { ThemeProvider as NextThemesProvider } from "next-themes"

export function ThemeProvider({
  children,
  ...props
}: React.ComponentProps<typeof NextThemesProvider>) {
  return (
    <NextThemesProvider
      {...props}
      enableColorScheme={false}
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      scriptProps={{ suppressHydrationWarning: true } as any}
    >
      {children}
    </NextThemesProvider>
  )
}
