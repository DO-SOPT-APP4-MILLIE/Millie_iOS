//
//  File.swift
//  Millie_iOS
//
//  Created by 신지원 on 11/26/23.
//

import UIKit

struct FavoriteModel {
    let favoriteImage : UIImage
    let favoriteText : String
}

let TodayFavoriteData = [FavoriteModel(favoriteImage: Image.todayFavoriteImage0, favoriteText: "서점 베스트"),
                         FavoriteModel(favoriteImage: Image.todayFavoriteImage1, favoriteText: "완독 지수"),
                         FavoriteModel(favoriteImage: Image.todayFavoriteImage2, favoriteText: "챗북 소식"),
                         FavoriteModel(favoriteImage: Image.todayFavoriteImage3, favoriteText: "밀리 시리즈"),
                         FavoriteModel(favoriteImage: Image.todayFavoriteImage4, favoriteText: "요즘 관심사"),
                         FavoriteModel(favoriteImage: Image.todayFavoriteImage5, favoriteText: "밀리 아티클")]
let TodayFistData = [Image.todayFistImage0,
                     Image.todayFistImage1,
                     Image.todayFistImage2,
                     Image.todayFistImage3,
                     Image.todayFistImage4,
                     Image.todayFistImage5]
let TodayMonthlyData = [Image.todayMonthlyImage0,
                        Image.todayMonthlyImage1,
                        Image.todayMonthlyImage2,
                        Image.todayMonthlyImage3,
                        Image.todayMonthlyImage4,
                        Image.todayMonthlyImage5,
                        Image.todayMonthlyImage6,
                        Image.todayMonthlyImage7,
                        Image.todayMonthlyImage8,
                        Image.todayMonthlyImage9]
let TodayOriginalData = [Image.todayOriginalImage0,
                         Image.todayOriginalImage1,
                         Image.todayOriginalImage2,
                         Image.todayOriginalImage3]
let TodayOriginalTagDummyData = ["인기","정기구독","소설","SF","로맨스","연재 중"]
let TodayPreferenceData = [Image.todayPreferenceImage0,
                           Image.todayPreferenceImage1,
                           Image.todayPreferenceImage2,
                           Image.todayPreferenceImage3,
                           Image.todayPreferenceImage4,
                           Image.todayPreferenceImage5]
let TodayPreferenceTagDummyData = ["트렌드","라이프","힐링","지적 교양","소설"]
