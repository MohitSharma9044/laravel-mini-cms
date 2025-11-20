import { createBrowserRouter } from "react-router-dom";
import AdminLayout from "../components/layout/AdminLayout";
import Login from "../pages/auth/Login";
import Dashboard from "../pages/dashboard/Dashboard";
import PostList from "../pages/posts/PostList";
import PostEditor from "../pages/posts/PostEditor";
import MediaLibrary from "../pages/media/MediaLibrary";
import PageList from "../pages/pages/PageList";
import RequireAuth from "../utils/RequireAuth";
import PageForm from "../pages/pages/PageForm";

const router = createBrowserRouter([
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/",
    element: (
      <RequireAuth>
        <AdminLayout />
      </RequireAuth>
    ),
    children: [
      { index: true, element: <Dashboard /> },

      { path: "posts", element: <PostList /> },
      { path: "posts/new", element: <PostEditor /> },
      { path: "posts/:id/edit", element: <PostEditor /> },

      { path: "media", element: <MediaLibrary /> },

      { path: "pages", element: <PageList /> },
      { path: "pages/new", element: <PageForm /> },
      { path: "pages/:id/edit", element: <PageForm /> },
    ],
  },
]);

export default router;
