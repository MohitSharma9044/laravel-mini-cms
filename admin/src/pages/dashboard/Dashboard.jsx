import { useEffect, useState } from "react";
import { FaFileAlt, FaPhotoVideo, FaUsers, FaFile } from "react-icons/fa";
import { useNavigate } from "react-router-dom";
import api from "../../api/axiosClient";

export default function Dashboard() {
  const navigate = useNavigate();

  const [stats, setStats] = useState({
    posts: 0,
    media: 0,
    pages: 0,
    users: 0,
  });

  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchStats();
  }, []);

  const fetchStats = async () => {
    setLoading(true);
    try {
      const res = await api.get("/dashboard-stats"); // backend API
      setStats(res.data);
    } catch (error) {
      console.error("Error fetching stats:", error);
    }
    setLoading(false);
  };

  const handleCardClick = (type) => {
    switch (type) {
      case "posts":
        navigate("/posts");
        break;
      case "media":
        navigate("/media");
        break;
      case "pages":
        navigate("/pages");
        break;
      case "users":
        navigate("/users");
        break;
      default:
        break;
    }
  };

  const cards = [
    { title: "Total Posts", icon: <FaFileAlt className="text-4xl text-blue-500" />, value: stats.posts, key: "posts" },
    { title: "Total Media", icon: <FaPhotoVideo className="text-4xl text-green-500" />, value: stats.media, key: "media" },
    { title: "Total Pages", icon: <FaFile className="text-4xl text-yellow-500" />, value: stats.pages, key: "pages" },
    { title: "Total Users", icon: <FaUsers className="text-4xl text-purple-500" />, value: stats.users, key: "users" },
  ];

  return (
    <div className="p-6">
      <h1 className="text-3xl font-bold mb-6">Dashboard</h1>

      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        {cards.map((card) => (
          <div
            key={card.key}
            onClick={() => handleCardClick(card.key)}
            className="flex items-center justify-between p-6 bg-white rounded-xl shadow hover:shadow-xl cursor-pointer transition transform hover:-translate-y-1"
          >
            <div>
              <h2 className="text-xl font-semibold">{card.title}</h2>
              <p className="text-3xl font-bold mt-2">{loading ? "..." : card.value}</p>
            </div>
            <div>{card.icon}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
