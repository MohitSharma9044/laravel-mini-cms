import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import api from "../../api/axiosClient";

// Fetch all pages
export const fetchPages = createAsyncThunk("pages/fetchPages", async () => {
  const res = await api.get("/pages");
  return res.data.data;
});

// Create a page
export const createPage = createAsyncThunk("pages/createPage", async (data) => {
  const formData = new FormData();
  formData.append("title", data.title);
  formData.append("content", data.content);
  formData.append("published", data.published);

  const res = await api.post("/pages", formData);
  return res.data.data;
});

// Update a page
export const updatePage = createAsyncThunk("pages/updatePage", async ({ id, data }) => {
  const formData = new FormData();
  formData.append("title", data.title);
  formData.append("content", data.content);
  formData.append("published", data.published);

  const res = await api.post(`/pages/${id}`, formData);
  return res.data.data;
});

// Delete a page
export const deletePage = createAsyncThunk("pages/deletePage", async (id) => {
  await api.delete(`/pages/${id}`);
  return id;
});

const pagesSlice = createSlice({
  name: "pages",
  initialState: {
    items: [],
    loading: false,
    error: null,
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchPages.pending, (state) => { state.loading = true; })
      .addCase(fetchPages.fulfilled, (state, action) => {
        state.items = action.payload;
        state.loading = false;
      })
      .addCase(fetchPages.rejected, (state, action) => {
        state.loading = false;
        state.error = action.error.message;
      })
      .addCase(createPage.fulfilled, (state, action) => {
        state.items.push(action.payload);
      })
      .addCase(updatePage.fulfilled, (state, action) => {
        const index = state.items.findIndex(p => p.id === action.payload.id);
        if (index !== -1) state.items[index] = action.payload;
      })
      .addCase(deletePage.fulfilled, (state, action) => {
        state.items = state.items.filter(p => p.id !== action.payload);
      });
  },
});

export default pagesSlice.reducer;
