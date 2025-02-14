package com.codingwithmitch.hero_datasource_test.network

import com.codingwithmitch.hero_datasource.network.model.HeroDto
import com.codingwithmitch.hero_datasource.network.model.toHero
import com.codingwithmitch.hero_domain.Hero
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

private val json = Json {
    ignoreUnknownKeys = true
}

fun serializeHeroData(jsonData: String): List<Hero>{
    val heros: List<Hero> = json.decodeFromString<List<HeroDto>>(jsonData).map { it.toHero() }
    return heros
}