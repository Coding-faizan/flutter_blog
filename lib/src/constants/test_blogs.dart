import 'package:flutter_blog/src/features/blog/domain/blog.dart';

final List<Blog> kTestBlogs = [
  Blog(
    id: 1,
    title: "Top Summer Fashion Trends 2024",
    content:
        "Discover the hottest summer fashion trends this year, from bold colors to sustainable fabrics. "
        "This season, oversized accessories, breezy linen outfits, and pastel palettes are making a strong comeback. "
        "Fashion influencers are mixing vintage styles with modern cuts, creating a unique blend of classic and contemporary. "
        "Eco-conscious shoppers are also embracing slow fashion, preferring quality over quantity. "
        "Whether you're strolling on the beach or attending a rooftop party, these trends will ensure you look effortlessly stylish. "
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    category: "fashion",
    author: "Emma Styles",
    date: DateTime.parse("2024-05-15"),
    imageUrl: "assets/images/fashion1.jpg",
  ),
  Blog(
    id: 2,
    title: "How to Style Denim on Denim",
    content:
        "Learn the best ways to pull off the double denim look without looking outdated. "
        "The key is to mix different shades of denim — a light wash jacket paired with dark jeans can create balance. "
        "Accessories like leather belts or colorful sneakers add contrast and break the monotony. "
        "Avoid matching denim pieces too closely, as that can feel flat and old-fashioned. "
        "Celebrities and street-style icons are bringing back the ‘Canadian tuxedo’ with modern twists, proving denim-on-denim is here to stay.",
    category: "fashion",
    author: "Luca Denim",
    date: DateTime.parse("2024-06-02"),
    imageUrl: "assets/images/fashion2.jpg",
  ),
  Blog(
    id: 3,
    title: "Euro 2024: Predictions and Key Players",
    content:
        "A deep dive into the teams and players to watch in the upcoming Euro 2024 championship. "
        "Top contenders like France, England, and Spain are preparing squads filled with both experienced veterans and rising stars. "
        "All eyes will be on emerging talents who could turn the tide of matches. "
        "The tactical approaches of coaches will play a crucial role, as defensive solidity clashes with high-press attacking styles. "
        "Fans can expect thrilling rivalries, dramatic penalty shootouts, and unforgettable goals in what promises to be one of the most exciting tournaments in recent years.",
    category: "sports",
    author: "James Football",
    date: DateTime.parse("2024-04-30"),
    imageUrl: "assets/images/sports1.jpg",
  ),
  Blog(
    id: 4,
    title: "The Rise of Women's Basketball",
    content:
        "How women's basketball is gaining global popularity and breaking records. "
        "From sold-out arenas to record-breaking TV viewership, the women’s game is finally receiving the recognition it deserves. "
        "Players are not only dominating on the court but also inspiring the next generation through advocacy and community engagement. "
        "Major sports brands are signing female athletes to headline endorsements, signaling a cultural shift in the industry. "
        "With international tournaments gaining traction, women’s basketball is entering a golden era of visibility and success.",
    category: "sports",
    author: "Sarah Hoops",
    date: DateTime.parse("2024-05-20"),
    imageUrl: "assets/images/sports2.jpg",
  ),
  Blog(
    id: 5,
    title: "Upcoming Blockbuster Movies of 2024",
    content:
        "From superhero sequels to indie gems, here are the most anticipated films this year. "
        "Studios are pushing the boundaries with groundbreaking CGI, diverse storytelling, and star-studded casts. "
        "Expect a mix of heartwarming family films, gripping thrillers, and visually stunning sci-fi adventures. "
        "Streaming platforms are also competing fiercely, releasing exclusive titles alongside theatrical releases. "
        "Cinemagoers can look forward to red-carpet premieres, fan theories, and unforgettable cinematic experiences.",
    category: "entertainment",
    author: "Alex Cinema",
    date: DateTime.parse("2024-06-10"),
    imageUrl: "assets/images/entertainment1.jpg",
  ),
  Blog(
    id: 6,
    title: "Best Music Festivals to Attend This Summer",
    content:
        "A guide to the top music festivals around the world, from Coachella to Glastonbury. "
        "This year’s lineups feature a mix of legendary artists and rising stars across all genres. "
        "Beyond the music, festivals are evolving into cultural events that celebrate food, art, and sustainability. "
        "Travelers are also combining festival trips with vacations, turning them into unforgettable experiences. "
        "Whether you’re into EDM, rock, or indie, there’s a festival tailored for every vibe and taste.",
    category: "entertainment",
    author: "DJ Melody",
    date: DateTime.parse("2024-05-05"),
    imageUrl: "assets/images/entertainment2.jpg",
  ),
  Blog(
    id: 7,
    title: "Sustainable Fashion: Brands Leading the Way",
    content:
        "These eco-friendly brands are revolutionizing the fashion industry with ethical practices. "
        "From using recycled fabrics to ensuring fair labor conditions, sustainable fashion is becoming mainstream. "
        "Consumers are increasingly asking brands tough questions about sourcing and carbon footprints. "
        "Social media has amplified the movement, with influencers promoting eco-conscious clothing lines. "
        "This shift not only reduces environmental harm but also promotes long-lasting, high-quality fashion pieces.",
    category: "fashion",
    author: "Eva Green",
    date: DateTime.parse("2024-06-18"),
    imageUrl: "assets/images/fashion3.jpg",
  ),
  Blog(
    id: 8,
    title: "NBA Finals: Who Will Take the Trophy?",
    content:
        "Analyzing the top contenders for the 2024 NBA championship. "
        "With star-studded lineups, tactical coaching, and breakout performances, the race for the trophy is more competitive than ever. "
        "Teams with deep benches and strong defensive setups are likely to dominate in seven-game series. "
        "Fans are already buzzing about potential matchups between league MVPs and rising rookies. "
        "No matter the outcome, the finals promise to deliver nail-biting finishes and iconic basketball moments.",
    category: "sports",
    author: "Mike Court",
    date: DateTime.parse("2024-06-01"),
    imageUrl: "assets/images/sports3.jpg",
  ),
  Blog(
    id: 9,
    title: "Most Binge-Worthy TV Shows Right Now",
    content:
        "From gripping dramas to hilarious comedies, these shows will keep you glued to the screen. "
        "Streaming platforms are battling for attention, releasing high-quality series with top-notch production. "
        "Critics are praising the variety of storytelling, from fantasy epics to realistic docu-dramas. "
        "Social media has amplified the hype, with fan theories and viral memes fueling conversations. "
        "Whether you’re looking for something lighthearted or deeply emotional, there’s a series perfect for your next binge-watch weekend.",
    category: "entertainment",
    author: "Stream Queen",
    date: DateTime.parse("2024-05-25"),
    imageUrl: "assets/images/entertainment3.jpg",
  ),
];
