import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchPages, updatePage, deletePage } from "../../store/slices/pageSlice";
import { FaEdit, FaTrash, FaCheckCircle, FaTimesCircle, FaPlus } from "react-icons/fa";
import { useNavigate } from "react-router-dom";

export default function PageList() {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { items = [], loading } = useSelector((state) => state.pages || {});

  useEffect(() => {
    dispatch(fetchPages());
  }, [dispatch]);

  const handleDelete = (id) => {
    if (confirm("Are you sure you want to delete this page?")) {
      dispatch(deletePage(id));
    }
  };

  const togglePublish = (page) => {
    dispatch(updatePage({ id: page.id, data: { ...page, published: !page.published } }));
  };

  return (
    <div className="container mx-auto py-6">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-3xl font-bold">Pages Manager</h1>
        <button
          onClick={() => navigate("/pages/new")} // navigate to PageForm route
          className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
        >
          <FaPlus /> Create New Page
        </button>
      </div>

      {loading ? (
        <p className="text-center">Loading pages...</p>
      ) : items.length > 0 ? (
        <div className="overflow-x-auto border rounded">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-100">
              <tr>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Title</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Slug</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Status</th>
                <th className="px-6 py-3 text-left text-sm font-medium text-gray-700">Actions</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {items.map((page) => (
                <tr key={page.id}>
                  <td className="px-6 py-4 whitespace-nowrap">{page.title}</td>
                  <td className="px-6 py-4 whitespace-nowrap">{page.slug}</td>
                  <td className="px-6 py-4 whitespace-nowrap">
                    {page.published ? (
                      <span className="flex items-center gap-1 text-green-600">
                        <FaCheckCircle /> Published
                      </span>
                    ) : (
                      <span className="flex items-center gap-1 text-gray-500">
                        <FaTimesCircle /> Draft
                      </span>
                    )}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap flex gap-2">
                    <button
                      onClick={() => togglePublish(page)}
                      className="text-sm px-2 py-1 rounded bg-yellow-200 hover:bg-yellow-300"
                      title={page.published ? "Unpublish" : "Publish"}
                    >
                      {page.published ? <FaTimesCircle /> : <FaCheckCircle />}
                    </button>
                    <button
                      onClick={() => navigate(`/pages/${page.id}/edit`)} // navigate to PageForm
                      className="text-sm px-2 py-1 rounded bg-blue-200 hover:bg-blue-300"
                      title="Edit"
                    >
                      <FaEdit />
                    </button>
                    <button
                      onClick={() => handleDelete(page.id)}
                      className="text-sm px-2 py-1 rounded bg-red-200 hover:bg-red-300"
                      title="Delete"
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
        <p className="text-center text-gray-500 mt-6">No pages found.</p>
      )}
    </div>
  );
}
