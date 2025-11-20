import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import api from "../../api/axiosClient";

// Fetch all posts
export const fetchPosts = createAsyncThunk("posts/fetch", async () => {
    const res = await api.get("/posts");
    return res.data;
});

// Create post
export const createPost = createAsyncThunk("posts/create", async (data) => {
    const formData = new FormData();
    Object.keys(data).forEach((key) => {
        if (key === "meta") {
            formData.append("meta_title", data.meta.title);
            formData.append("meta_description", data.meta.description);
        } else if (key === "featured_image" && data[key]) {
            formData.append("featured_image", data[key]);
        } else if (key === "published") {
            formData.append("published", data.published ? 1 : 0);
        } else {
            formData.append(key, data[key]);
        }
    });

    const res = await api.post("/posts", formData, {
        headers: { "Content-Type": "multipart/form-data" },
    });
    return res.data;
});


export const togglePublish = createAsyncThunk(
    "posts/togglePublish",
    async ({ id }) => {
        const res = await api.patch(`/posts/${id}/publish`);
        return res.data.data;
    }
);

// Update post thunk
export const updatePost = createAsyncThunk(
    "posts/update",
    async ({ id, data }) => {
        const formData = new FormData();

        Object.keys(data).forEach((key) => {
            if (key === "meta") {
                formData.append("meta_title", data.meta.title);
                formData.append("meta_description", data.meta.description);
            } else if (key === "featured_image" && data[key] instanceof File) {
                formData.append("featured_image", data[key]);
            } else if (key === "published") {
                formData.append("published", data.published ? 1 : 0);
            } else {
                formData.append(key, data[key]);
            }
        });

        formData.append("_method", "PUT");

        const res = await api.post(`/posts/${id}`, formData, {
            headers: { "Content-Type": "multipart/form-data" },
        });

        return res.data;
    }
);


// Delete post
export const deletePost = createAsyncThunk("posts/delete", async (id) => {
    await api.delete(`/posts/${id}`);
    return id;
});

const postsSlice = createSlice({
    name: "posts",
    initialState: {
        items: [],
        loading: false,
    },
    extraReducers: (builder) => {
        builder
            .addCase(fetchPosts.pending, (state) => {
                state.loading = true;
            })
            .addCase(fetchPosts.fulfilled, (state, action) => {
                state.items = action.payload?.data || [];
                state.loading = false;
            })
            .addCase(fetchPosts.rejected, (state) => {
                state.items = [];
                state.loading = false;
            })
            .addCase(deletePost.fulfilled, (state, action) => {
                state.items = state.items.filter((p) => p.id !== action.payload);
            })
            .addCase(togglePublish.fulfilled, (state, action) => {
                const index = state.items.findIndex((p) => p.id === action.payload.id);
                if (index !== -1) {
                    state.items[index] = action.payload;
                }
            });;
    },
});

export default postsSlice.reducer;
