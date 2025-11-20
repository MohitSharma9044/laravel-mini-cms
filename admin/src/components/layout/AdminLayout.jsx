import Sidebar from "./Sidebar";
import Header from "./Header";
import { Outlet } from "react-router-dom";

export default function AdminLayout() {
  return (
    <div className="flex">
      <Sidebar />

      <main className="ml-64 w-full min-h-screen bg-gray-50 p-8">
        <Header />
        <div className="mt-6">
          <Outlet />
        </div>
      </main>
    </div>
  );
}
