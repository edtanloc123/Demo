package com.example.restapi;

import static com.example.restapi.API.BASE_URL;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class APIClient {
    private static APIClient instance = null;
    private final API myAPI;

    private APIClient() {
        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(API.BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
        myAPI = retrofit.create(API.class);
    }

    public static synchronized APIClient getInstance() {
        if (instance == null) {
            instance = new APIClient();
        }
        return instance;
    }

    public API getMyAPI() {return myAPI;}
}
