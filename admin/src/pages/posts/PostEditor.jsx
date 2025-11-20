import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { createPost, updatePost } from "../../store/slices/postsSlice";
import { useNavigate, useParams } from "react-router-dom";
import api from "../../api/axiosClient";
import RichTextEditor from "../../components/ui/RichTextEditor";

export default function PostEditor() {
  const { id } = useParams();
  const editing = Boolean(id);
  const dispatch = useDispatch();
  const nav = useNavigate();

  const [form, setForm] = useState({
    title: "",
    slug: "",
    content: "",
    meta: { title: "", description: "" },
    published: 0,
    featured_image: null,
  });

  const handle = (e) => {
    const { name, value, files, checked } = e.target;

    if (name === "meta_title") {
      setForm((f) => ({ ...f, meta: { ...f.meta, title: value } }));
    } else if (name === "meta_description") {
      setForm((f) => ({ ...f, meta: { ...f.meta, description: value } }));
    } else if (name === "featured_image") {
      setForm((f) => ({ ...f, featured_image: files[0] }));
    } else if (name === "published") {
      setForm((f) => ({ ...f, published: checked ? 1 : 0 }));
    } else {
      setForm((f) => ({
        ...f,
        [name]: value,
        ...(name === "title" && { slug: value.toLowerCase().replace(/ /g, "-") }),
      }));
    }
  };

  // Load post when editing
  useEffect(() => {
    if (editing) {
      api.get(`/posts/${id}`).then((res) => {
        const data = res.data.data;
        setForm({
          title: data.title,
          slug: data.slug,
          content: data.content,
          meta: data.meta || { title: "", description: "" },
          published: data.published ? 1 : 0,
          featured_image: data.featured_image || null,
        });
      });
    }
  }, [id, editing]);

  const submit = async (e) => {
    e.preventDefault();
    try {
      if (editing) {
        await dispatch(updatePost({ id, data: form }));
      } else {
        await dispatch(createPost(form));
      }
      nav("/posts");
    } catch (err) {
      console.error("Error saving post:", err);
    }
  };

  return (
    <div className="max-w-full mx-auto mt-10">
      <div className="bg-white shadow-md rounded-lg p-6">
        <h1 className="text-3xl font-bold mb-6">
          {editing ? "Edit Post" : "Create Post"}
        </h1>

        <form className="space-y-6" onSubmit={submit}>
          {/* TITLE */}
          <div>
            <label className="block mb-1 font-semibold">Title</label>
            <input
              name="title"
              value={form.title}
              onChange={handle}
              placeholder="Title"
              className="w-full border px-3 py-2 rounded"
            />
          </div>

          {/* SLUG */}
          <div>
            <label className="block mb-1 font-semibold">Slug</label>
            <input
              name="slug"
              value={form.slug}
              onChange={handle}
              placeholder="Slug"
              className="w-full border px-3 py-2 rounded"
            />
          </div>

          {/* CONTENT */}
          <div>
            <label className="block mb-1 font-semibold">Content</label>
            <RichTextEditor
              value={form.content}
              onChange={(value) => setForm((f) => ({ ...f, content: value }))}
            />
          </div>

          {/* META TITLE */}
          <div>
            <label className="block mb-1 font-semibold">Meta Title</label>
            <input
              name="meta_title"
              value={form.meta.title}
              onChange={handle}
              placeholder="Meta Title"
              className="w-full border px-3 py-2 rounded"
            />
          </div>

          {/* META DESCRIPTION */}
          <div>
            <label className="block mb-1 font-semibold">Meta Description</label>
            <textarea
              name="meta_description"
              value={form.meta.description}
              onChange={handle}
              rows={3}
              placeholder="Meta Description"
              className="w-full border px-3 py-2 rounded"
            />
          </div>

          {/* PUBLISHED */}
          <div className="flex items-center space-x-2">
            <input
              type="checkbox"
              name="published"
              checked={form.published === 1}
              onChange={handle}
              className="h-4 w-4"
            />
            <label>Published</label>
          </div>

          {/* FEATURED IMAGE */}
          <div>
            <label className="block mb-1 font-semibold">Featured Image</label>
            <input
              type="file"
              name="featured_image"
              onChange={handle}
              className="w-full border px-3 py-2 rounded mt-2"
            />

            {form.featured_image && (
              <img
                src={
                  form.featured_image instanceof File
                    ? URL.createObjectURL(form.featured_image)
                    : form.featured_image
                }
                alt="Featured"
                className="w-32 mt-2 rounded"
              />
            )}
          </div>

          {/* SUBMIT */}
          <button
            type="submit"
            className="w-full px-6 py-2 bg-black text-white rounded hover:bg-gray-800 transition"
          >
            Save Post
          </button>
        </form>
      </div>
    </div>
  );
}
