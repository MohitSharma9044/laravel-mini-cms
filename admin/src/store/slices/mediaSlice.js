import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import api from "../../api/axiosClient";

// Fetch all media
export const fetchMedia = createAsyncThunk("media/fetch", async () => {
  const res = await api.get("/media");
  return res.data.data; // return array
});

// Upload media
export const uploadMedia = createAsyncThunk("media/upload", async (file) => {
  const formData = new FormData();
  formData.append("file", file);

  const res = await api.post("/media", formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });

  return res.data.data; // return newly created media
});

// Delete media
export const deleteMedia = createAsyncThunk("media/delete", async (id) => {
  await api.delete(`/media/${id}`);
  return id; // return id to remove from state
});

const mediaSlice = createSlice({
  name: "media",
  initialState: {
    items: [],
    loading: false,
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchMedia.pending, (state) => {
        state.loading = true;
      })
      .addCase(fetchMedia.fulfilled, (state, action) => {
        state.items = action.payload;
        state.loading = false;
      })
      .addCase(fetchMedia.rejected, (state) => {
        state.items = [];
        state.loading = false;
      })
      .addCase(uploadMedia.fulfilled, (state, action) => {
        state.items.unshift(action.payload);
      })
      .addCase(deleteMedia.fulfilled, (state, action) => {
        state.items = state.items.filter((m) => m.id !== action.payload);
      });
  },
});

export default mediaSlice.reducer;
