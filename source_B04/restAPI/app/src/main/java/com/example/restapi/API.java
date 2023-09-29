package com.example.restapi;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

public interface API {

    String BASE_URL="https://raw.githubusercontent.com/ltbaotran/api/main/";

    @GET("catelist")
    Call<List<Season>> getSeasons();
}
