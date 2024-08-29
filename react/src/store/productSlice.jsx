import { createAsyncThunk, createSlice } from "@reduxjs/toolkit"
import axios from "axios"
import { BASE_URL } from "../components/services/CallApi";

//define the initial state
const initialState = {
	data: [],
	status: 'idle',
	error: null,
	totalPage:0
}
// Fetch data from database using api
export const fetchData = createAsyncThunk('data/fetchData', async ({ currentPage, perPage, search }) => {
	const response = await axios.get(`${BASE_URL}/users`, {
		params: {
        page: currentPage,
		perPage: perPage,
		searchKey: search,
      },
	});

	return response.data;
})

// Create reducers slices
const productSlice = createSlice({
  name: 'data',
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchData.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchData.fulfilled, (state, action) => {
        state.status = 'succeeded';
		state.data = action.payload.users.data;
		state.totalPage = action.payload.users.last_page;
      })
      .addCase(fetchData.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message;
      });
  },
});

export default productSlice.reducer;
