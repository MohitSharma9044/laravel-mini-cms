import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import api from "../../api/axiosClient";

export const login = createAsyncThunk("/auth/login", async({ email, password }) => {
    const res = await api.post("/login", { email, password });
    localStorage.setItem("token", res.data.token);
    return res.data.user;
});

const authSlice = createSlice({
name: "auth",
  initialState: {
    user: null,
  },

  reducers: {
    logoutLocal(state) {
      state.user = null;
      localStorage.removeItem("token");
    },
  },
  extraReducers: (builder) => {
    builder.addCase(login.fulfilled, (state, action) => {
      state.user = action.payload;
    });
  },
});

export const { logoutLocal } = authSlice.actions;
export default authSlice.reducer;