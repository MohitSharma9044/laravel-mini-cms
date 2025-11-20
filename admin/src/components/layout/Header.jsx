import { useDispatch } from "react-redux";
import { logoutLocal } from "../../store/slices/authSlice";
import { useNavigate } from "react-router-dom";

export default function Header() {
  const dispatch = useDispatch();
  const nav = useNavigate();

  const logout = () => {
    dispatch(logoutLocal());
    nav("/login");
  };

  return (
    <header className="flex justify-between items-center py-4 border-b">
      <h2 className="text-xl font-semibold">Admin Dashboard</h2>

      <button
        onClick={logout}
        className="px-4 py-2 bg-black text-white rounded hover:bg-neutral-900"
      >
        Logout
      </button>
    </header>
  );
}
