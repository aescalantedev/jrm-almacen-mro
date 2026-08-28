const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/productos/page.tsx');
let content = fs.readFileSync(filePath, 'utf-8');

// 1. superadmin fix
content = content.replace(
  `const isAdmin = user?.rol === "admin" || user?.rol === "auditor";`,
  `const isAdmin = user?.rol === "admin" || user?.rol === "auditor" || user?.rol === "superadmin";`
);

// 2. AlertDialog imports
if (!content.includes('AlertDialogAction')) {
  content = content.replace(
    `import { Button } from "@/components/ui/button";`,
    `import { Button } from "@/components/ui/button";\nimport { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle } from "@/components/ui/alert-dialog";`
  );
}

// 3. state
if (!content.includes('deleteConfirmOpen')) {
  content = content.replace(
    `const [deletingMultiple, setDeletingMultiple] = useState(false);`,
    `const [deletingMultiple, setDeletingMultiple] = useState(false);\n  const [deleteConfirmOpen, setDeleteConfirmOpen] = useState(false);`
  );
}

// 4. replace handleDeleteSelected logic
const oldFnStart = `  const handleDeleteSelected = async () => {
    if (selectedSkus.length === 0) return;
    if (!confirm(\`¿Estás seguro de eliminar los \${selectedSkus.length} productos seleccionados? Esta acción no se puede deshacer.\`)) return;

    setDeletingMultiple(true);`;

const newFnStart = `  const confirmDeleteSelected = () => {
    if (selectedSkus.length === 0) return;
    setDeleteConfirmOpen(true);
  };

  const executeDeleteSelected = async () => {
    setDeleteConfirmOpen(false);
    setDeletingMultiple(true);`;

content = content.replace(oldFnStart, newFnStart);

// Handle cases where the if(!confirm(...)) was already removed or missing:
if (content.includes('const handleDeleteSelected = async () => {')) {
    content = content.replace(/const handleDeleteSelected = async \(\) => \{\s+if \(selectedSkus\.length === 0\) return;\s+setDeletingMultiple\(true\);/, newFnStart);
}

content = content.replace(/onClick=\{handleDeleteSelected\}/g, `onClick={confirmDeleteSelected}`);

// 5. Append AlertDialog to end
const endTag = `    </div>
  );
}`;

if (!content.includes('AlertDialogContent>')) {
  const dialogHTML = `
      {/* DIALOG DE CONFIRMACION DE ELIMINACION */}
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
  
  // replace only the very last occurrence of `</div>\n  );\n}`
  const lastIndex = content.lastIndexOf(endTag);
  if (lastIndex !== -1) {
    content = content.substring(0, lastIndex) + dialogHTML;
  }
}

fs.writeFileSync(filePath, content);
console.log("Fixed app/productos/page.tsx completely.");
