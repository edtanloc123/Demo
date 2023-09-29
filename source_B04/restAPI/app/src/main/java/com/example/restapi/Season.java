package com.example.restapi;

import androidx.annotation.NonNull;

public class Season {
    int catId;
    String name;
    String image;

    @NonNull
    @Override
    public String toString()
    {
        return "Season{" +
                "catId=" + catId +
                ", name='" + name + '\'' +
                ", image='" + image +'\'' +
                '}';
    }
}
