import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createPage, updatePage, fetchPages } from "../../store/slices/pageSlice";
import { useNavigate, useParams } from "react-router-dom";
import RichTextEditor from "../../components/ui/RichTextEditor";

export default function PageForm() {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { id } = useParams();
  const { items } = useSelector((state) => state.pages || { items: [] });

  const editingPage = id ? items.find((p) => p.id === parseInt(id)) : null;

  const [title, setTitle] = useState(editingPage?.title || "");
  const [content, setContent] = useState(editingPage?.content || "");
  const [published, setPublished] = useState(editingPage?.published || false);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!items.length) {
      dispatch(fetchPages());
    }
  }, [dispatch, items.length]);

  useEffect(() => {
    if (editingPage) {
      setTitle(editingPage.title);
      setContent(editingPage.content);
      setPublished(editingPage.published);
    }
  }, [editingPage]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    const data = { title, content, published };

    if (editingPage) {
      await dispatch(updatePage({ id: editingPage.id, data }));
    } else {
      await dispatch(createPage(data));
    }

    setLoading(false);
    navigate("/pages");
  };

  return (
    <div className="container mx-auto py-6">
      <div className="bg-white shadow-lg rounded-lg p-6 max-w-full mx-auto">
        <h1 className="text-3xl font-bold mb-6 text-center">
          {editingPage ? "Edit Page" : "Create New Page"}
        </h1>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Title */}
          <div className="w-full">
            <label className="block mb-2 font-medium text-gray-700">Title</label>
            <input
              type="text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              className="w-full border border-gray-300 rounded px-4 py-2 focus:ring-2 focus:ring-blue-400 focus:outline-none"
              placeholder="Enter page title"
              required
            />
          </div>

          {/* Content */}
          <div className="w-full">
            <label className="block mb-2 font-medium text-gray-700">Content</label>
            <RichTextEditor value={content} onChange={setContent} />
          </div>

          {/* Published */}
          <div className="flex items-center gap-2">
            <input
              type="checkbox"
              checked={published}
              onChange={(e) => setPublished(e.target.checked)}
              id="published"
              className="w-4 h-4"
            />
            <label htmlFor="published" className="font-medium text-gray-700">
              Published
            </label>
          </div>

          {/* Buttons */}
          <div className="flex justify-end gap-4">
            <button
              type="submit"
              disabled={loading}
              className={`px-6 py-2 bg-blue-600 text-white font-medium rounded hover:bg-blue-700 ${loading ? "opacity-50 cursor-not-allowed" : ""
                }`}
            >
              {editingPage ? "Update Page" : "Create Page"}
            </button>
            <button
              type="button"
              onClick={() => navigate("/pages")}
              className="px-6 py-2 bg-gray-300 text-gray-700 font-medium rounded hover:bg-gray-400"
            >
              Cancel
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
