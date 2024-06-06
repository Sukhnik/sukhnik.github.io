---
layout: post
read_time: true
show_date: true
title: "sukhnik.sh script"
date: 2024-04-06
img: posts/20240606/01.png
tags: [scripting, bash, fuel]
category: opinion
author: Linusnov
description: "How does Sukhnik script work?"
---

# Fuel Calculus

In aviation, accurately calculating the fuel needed for a flight is crucial to ensure safety and efficiency. I have developed a Bash program that facilitates this calculation, allowing pilots and air operators to determine the necessary amount of fuel based on several essential parameters.

### How does this script work?

- Flight Distance (in nautical miles)
- Fuel Consumption per Hour (in kg per hour)
- Cruise Speed (in knots)
- Fuel Reserve (as a percentage or fixed amount)

> The script has other functions, in this post I explain one of them.

### Installation

#### Prerequisites
- Unix-based operating system (Linux, macOS)
- Bash shell installed (usually pre-installed on most Unix systems)

#### Installation Instructions
```sh
sh -c "$(wget https://github.com/linusnov/linusnov.github.io/blob/main/script/sukhnik.sh)"
```
#### Example usage
```sh 
./sukhnik.sh 
```
![](https://i.postimg.cc/jdb4PTPC/image.png)
> Simple menu Sukhnik feel other functions

```sh 
./sukhnik.sh -d 4000
```
![](https://i.postimg.cc/hPvPCz9Y/image.png)
