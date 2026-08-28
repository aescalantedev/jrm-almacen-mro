const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/users/page.tsx');
let content = fs.readFileSync(filePath, 'utf-8');

// Replace styling for superadmin
content = content.replace(/u\.rol === "admin" && "bg-primary\/10 text-primary",/g, `u.rol === "superadmin" && "bg-purple-500/10 text-purple-600",\n                            u.rol === "admin" && "bg-primary/10 text-primary",`);

// Add SelectItem for superadmin
content = content.replace(/<SelectItem value="admin" className="text-xs font-bold">Admin<\/SelectItem>/g, `<SelectItem value="superadmin" className="text-xs font-bold">Super Admin</SelectItem>\n                              <SelectItem value="admin" className="text-xs font-bold">Admin</SelectItem>`);

fs.writeFileSync(filePath, content);
console.log("Updated app/users/page.tsx with superadmin role");
