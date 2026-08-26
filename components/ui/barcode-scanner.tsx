"use client";

import React, { useEffect, useRef } from "react";
import { Html5QrcodeScanner, Html5QrcodeScanType } from "html5-qrcode";
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog";

interface BarcodeScannerProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  onResult: (result: string) => void;
}

export function BarcodeScanner({ open, onOpenChange, onResult }: BarcodeScannerProps) {
  const scannerRef = useRef<Html5QrcodeScanner | null>(null);

  useEffect(() => {
    if (open) {
      const timeoutId = setTimeout(() => {
        if (!document.getElementById("mro-barcode-reader")) return;
        
        scannerRef.current = new Html5QrcodeScanner(
          "mro-barcode-reader",
          {
            fps: 10,
            qrbox: { width: 250, height: 150 },
            aspectRatio: 1.0,
            supportedScanTypes: [Html5QrcodeScanType.SCAN_TYPE_CAMERA],
          },
          false
        );

        scannerRef.current.render(
          (decodedText) => {
            // Success
            if (scannerRef.current) {
              scannerRef.current.clear();
            }
            onOpenChange(false);
            onResult(decodedText);
          },
          (err) => {
            // Ignore ongoing scan errors
          }
        );
      }, 100);

      return () => {
        clearTimeout(timeoutId);
        if (scannerRef.current) {
          try {
            scannerRef.current.clear();
          } catch (e) {
            // Safely ignore cleanup errors
          }
        }
      };
    }
  }, [open, onOpenChange, onResult]);

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent aria-describedby={undefined} className="sm:max-w-[400px] flex flex-col items-center">
        <DialogHeader>
          <DialogTitle className="text-center text-lg font-black uppercase tracking-tight">Escáner de Código</DialogTitle>
        </DialogHeader>
        
        <div className="w-full flex justify-center py-2 bg-secondary/5 rounded-2xl overflow-hidden min-h-[300px]">
          <div id="mro-barcode-reader" className="w-full max-w-[320px] rounded-xl overflow-hidden [&_#mro-barcode-reader__scan_region]:rounded-xl [&_video]:rounded-xl [&_video]:object-cover" />
        </div>
        
        <p className="text-[11px] text-center text-muted-foreground font-medium uppercase tracking-tight px-4 mt-2">
          Apunta la cámara del celular hacia el código de barras o código QR. El escaneo es automático.
        </p>
      </DialogContent>
    </Dialog>
  );
}
