import { NavLink } from "react-router-dom";
import { FaTachometerAlt, FaList, FaTags, FaFileAlt, FaPhotoVideo, FaFile } from "react-icons/fa";

export default function Sidebar() {
  const navItems = [
    { name: "Dashboard", to: "/", icon: <FaTachometerAlt /> },
    { name: "Posts", to: "/posts", icon: <FaFileAlt /> },
    { name: "Media", to: "/media", icon: <FaPhotoVideo /> },
    { name: "CMS Pages", to: "/pages", icon: <FaFile /> },
  ];

  return (
    <aside className="fixed left-0 top-0 h-screen w-64 bg-white border-r shadow-lg px-6 py-8 flex flex-col">
      <h1 className="text-2xl font-bold mb-10 text-center">CMS Admin</h1>

      <nav className="flex flex-col gap-2">
        {navItems.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) =>
              `flex items-center gap-3 px-4 py-3 rounded-lg transition-colors ${isActive ? "bg-black text-white" : "text-gray-700 hover:bg-gray-100"
              }`
            }
          >
            <span className="text-lg">{item.icon}</span>
            <span className="font-medium">{item.name}</span>
          </NavLink>
        ))}
      </nav>

      {/* Optional: footer or version info */}
      <div className="mt-auto text-gray-400 text-sm text-center">
        CMS Admin v1.0
      </div>
    </aside>
  );
}
