import { configureStore } from "@reduxjs/toolkit";
import authReducer from "./slices/authSlice";
import postsReducer from "./slices/postsSlice";
import mediaReducer from "./slices/mediaSlice";
import pageReducer from "./slices/pageSlice";

const store = configureStore({
  reducer: {
    auth: authReducer,
    posts: postsReducer,
    media: mediaReducer,
    pages: pageReducer,
  },
});

export default store;
