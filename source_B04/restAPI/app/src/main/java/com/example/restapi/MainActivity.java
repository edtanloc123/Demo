package com.example.restapi;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;

import com.example.restapi.databinding.ActivityMainBinding;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    public static final String LOG_TAG = MainActivity.class.getSimpleName();
    ActivityMainBinding binding;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMainBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        getSeasons();

    }

    private void getSeasons() {
        Call<List<Season>> callSeason = APIClient.getInstance().getMyAPI().getSeasons();;
        callSeason.enqueue(new Callback<List<Season>>() {
            @Override
            public void onResponse(@NonNull Call<List<Season>> call, Response<List<Season>> response) {
                List<Season> seasonList = response.body();
                //xuất ra màn hình
                if (seasonList != null)
                {
                    StringBuilder dataString = new StringBuilder();
                    for (Season season: seasonList) {
                        dataString.append(season.toString());
                        dataString.append("\n");
                    }
                    binding.tvMsg.setText(dataString);
                }
            }

            @Override
            public void onFailure(Call<List<Season>> call, Throwable t) {
                Log.e(LOG_TAG, t.getMessage());
            }
        });
    }
}