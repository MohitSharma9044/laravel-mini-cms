import { useEffect, useState, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchMedia, uploadMedia, deleteMedia } from "../../store/slices/mediaSlice";
import { FaTrash, FaUpload } from "react-icons/fa";

export default function MediaLibrary() {
  const dispatch = useDispatch();
  const { items, loading } = useSelector((s) => s.media);
  const [file, setFile] = useState(null);
  const [dragActive, setDragActive] = useState(false);
  const inputRef = useRef(null);

  useEffect(() => {
    dispatch(fetchMedia());
  }, [dispatch]);

  const handleUpload = () => {
    if (file) {
      dispatch(uploadMedia(file));
      setFile(null);
    }
  };

  const handleDelete = (id) => {
    if (confirm("Delete this media?")) {
      dispatch(deleteMedia(id));
    }
  };

  const handleDrag = (e) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") setDragActive(true);
    if (e.type === "dragleave") setDragActive(false);
  };

  const handleDrop = (e) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      setFile(e.dataTransfer.files[0]);
    }
  };

  const handleClickUploadArea = () => {
    inputRef.current.click();
  };

  return (
    <div className="container mx-auto py-6">
      <h1 className="text-3xl font-bold mb-6 text-center">Media Library</h1>

      {/* Upload Area */}
      <div
        className={`mb-6 border-2 border-dashed rounded-lg p-6 text-center cursor-pointer transition-colors 
                    ${dragActive ? "border-blue-500 bg-blue-50" : "border-gray-300 hover:border-gray-500"}`}
        onDragEnter={handleDrag}
        onDragOver={handleDrag}
        onDragLeave={handleDrag}
        onDrop={handleDrop}
        onClick={handleClickUploadArea}
      >
        <input
          type="file"
          className="hidden"
          ref={inputRef}
          onChange={(e) => setFile(e.target.files[0])}
        />
        <div className="flex flex-col items-center justify-center gap-2">
          <FaUpload className="text-4xl text-gray-400" />
          <p className="text-gray-600">
            {file ? `Selected file: ${file.name}` : "Drag & drop a file here or click to upload"}
          </p>
          {file && (
            <button
              onClick={(e) => {
                e.stopPropagation();
                handleUpload();
              }}
              className="mt-2 px-4 py-2 bg-black text-white rounded hover:bg-gray-800"
            >
              Upload
            </button>
          )}
        </div>
      </div>

      {/* Loading */}
      {loading && <p className="text-center text-gray-500 mb-4">Loading media...</p>}

      {/* Media Grid */}
      {items.length > 0 ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
          {items.map((media) => (
            <div
              key={media.id}
              className="relative border rounded-lg overflow-hidden shadow hover:shadow-lg transition-shadow"
            >
              <img
                src={media.path}
                alt={media.filename}
                className="w-full h-48 object-cover"
              />
              <button
                onClick={() => handleDelete(media.id)}
                className="absolute top-2 right-2 bg-red-600 text-white p-2 rounded-full hover:bg-red-700 transition"
              >
                <FaTrash />
              </button>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-gray-500 text-center mt-8">No media found.</p>
      )}
    </div>
  );
}
