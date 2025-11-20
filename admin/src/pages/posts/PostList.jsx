import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchPosts, deletePost, togglePublish } from "../../store/slices/postsSlice"; // add togglePublish
import { Link } from "react-router-dom";
import { FaEdit, FaTrash, FaPlus, FaEye, FaEyeSlash } from "react-icons/fa";

export default function PostList() {
  const dispatch = useDispatch();
  const { items, loading } = useSelector((s) => s.posts);

  useEffect(() => {
    dispatch(fetchPosts());
  }, [dispatch]);

  const remove = async (id) => {
    if (!confirm("Delete this post?")) return;
    dispatch(deletePost(id));
  };

const togglePublished = (post) => {
  dispatch(togglePublish({ id: post.id })).then(() => {
    dispatch(fetchPosts());
  });
};

  if (loading) return <p>Loading posts...</p>;

  return (
    <div className="container mx-auto py-6">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold flex items-center gap-2">
          Posts
        </h1>
        <Link
          to="/posts/new"
          className="flex items-center gap-2 px-4 py-2 bg-black text-white rounded-lg hover:bg-neutral-900"
        >
          <FaPlus /> New Post
        </Link>
      </div>

      {Array.isArray(items) && items.length > 0 ? (
        <div className="overflow-x-auto">
          <table className="min-w-full bg-white rounded-xl shadow">
            <thead className="bg-gray-100">
              <tr>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Image</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Title</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Slug</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Published</th>
                <th className="px-6 py-3 text-center text-sm font-medium text-gray-700">Actions</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200">
              {items.map((post) => (
                <tr key={post.id} className="hover:bg-gray-50">
                  <td className="px-6 py-4">
                    {post.featured_image ? (
                      <img
                        src={post.featured_image}
                        alt={post.title}
                        className="w-16 h-16 object-cover rounded-lg"
                      />
                    ) : (
                      <div className="w-16 h-16 bg-gray-200 rounded-lg flex items-center justify-center text-gray-400 text-xs">
                        No Image
                      </div>
                    )}
                  </td>
                  <td className="px-6 py-4 font-medium text-gray-900">{post.title}</td>
                  <td className="px-6 py-4 text-gray-500">{post.slug}</td>
                  <td className="px-6 py-4 text-center">
                    <button
                      onClick={() => togglePublished(post)}
                      className="flex items-center justify-center w-10 h-10 mx-auto rounded-lg hover:bg-gray-200 transition"
                    >
                      {post.published ? <FaEye className="text-green-600" /> : <FaEyeSlash className="text-red-600" />}
                    </button>
                  </td>
                  <td className="px-6 py-4 text-center flex justify-center gap-2">
                    <Link
                      to={`/posts/${post.id}/edit`}
                      className="px-3 py-1 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                    >
                      <FaEdit />
                    </Link>
                    <button
                      onClick={() => remove(post.id)}
                      className="px-3 py-1 bg-red-600 text-white rounded-lg hover:bg-red-700"
                    >
                      <FaTrash />
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>No posts found.</p>
      )}
    </div>
  );
}
