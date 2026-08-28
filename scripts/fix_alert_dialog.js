const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/productos/page.tsx');
let content = fs.readFileSync(filePath, 'utf-8');

// 1. Add import for AlertDialog
if (!content.includes('AlertDialog')) {
  const dialogImport = `import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog";`;
  
  const alertDialogImport = `import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog";\n`;

  content = content.replace(dialogImport, dialogImport + '\n' + alertDialogImport);
}

// 2. Add state for delete confirmation
if (!content.includes('deleteConfirmOpen')) {
  const stateRegex = /const \[deletingMultiple, setDeletingMultiple\] = useState\(false\);/;
  content = content.replace(stateRegex, `const [deletingMultiple, setDeletingMultiple] = useState(false);\n  const [deleteConfirmOpen, setDeleteConfirmOpen] = useState(false);`);
}

// 3. Modify handleDeleteSelected to just open the modal
const oldDeleteFnStart = `  const handleDeleteSelected = async () => {
    if (selectedSkus.length === 0) return;
    if (!confirm(\`¿Estás seguro de eliminar los \${selectedSkus.length} productos seleccionados? Esta acción no se puede deshacer.\`)) return;

    setDeletingMultiple(true);`;

const newDeleteFnStart = `  const confirmDeleteSelected = () => {
    if (selectedSkus.length === 0) return;
    setDeleteConfirmOpen(true);
  };

  const executeDeleteSelected = async () => {
    setDeleteConfirmOpen(false);
    setDeletingMultiple(true);`;

content = content.replace(oldDeleteFnStart, newDeleteFnStart);
content = content.replace(/if \(\!confirm\([\s\S]*?\)\) return;/g, '');

// Also replace the button click handler if it was calling handleDeleteSelected
content = content.replace(/onClick=\{handleDeleteSelected\}/g, 'onClick={confirmDeleteSelected}');

// 4. Add the AlertDialog component at the end of the return statement
const endOfReturn = `    </div>
  );
}`;

const alertDialogJSX = `      {/* DIALOG DE CONFIRMACION DE ELIMINACION */}
      <AlertDialog open={deleteConfirmOpen} onOpenChange={setDeleteConfirmOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>¿Eliminar productos?</AlertDialogTitle>
            <AlertDialogDescription>
              ¿Estás seguro de que deseas eliminar los {selectedSkus.length} productos seleccionados?
              Esta acción no se puede deshacer y borrará el historial de estos productos.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel disabled={deletingMultiple}>Cancelar</AlertDialogCancel>
            <AlertDialogAction 
              onClick={executeDeleteSelected}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
              disabled={deletingMultiple}
            >
              Eliminar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}`;

content = content.replace(endOfReturn, alertDialogJSX);

fs.writeFileSync(filePath, content);
console.log('Updated app/productos/page.tsx');
