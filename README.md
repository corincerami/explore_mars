# Explore Mars

## About this Gem

While I was attending [Launch Academy](http://www.launchacademy.com/), I decided to build a simple API in Rails that would allow myself, other developers, researchers, students, or anyone else to more easily access photo data from NASA's Mars rover Curiosity. The idea was that by surfacing those photos through an API, building apps that took advantage of this public resource would become easier.

Since then I decided that to make it even easier, I would build a gem that provides a few easy to use methods that access that API for you. My hope is to eventually build a similar API for the Opportunity rover, which would also ideally be accessible through this gem.

## Installing

Installation is as easy as any other gem:

```
$ gem install explore_mars
```

## Usage

There are only a few parts to this gem so far, so it's relatively simple to use. By calling:

```ruby
ExploreMars::Call.get(sol, camera)
```

you can make a call to the API, which will return a set of ```Photos```. The ```sol``` parameter is the Martian date of Curiosity's expedition during which the photo was taken. The ```camera``` parameter is the particular camera on the rover that the photo was taken with. The cameras are as follows:

  | Abbreviation | Camera                         |
  |--------------|--------------------------------|
  |  FHAZ        |  Front Hazard Avoidance Camera |
  |  RHAZ        |  Rear Hazard Avoidance Camera  |
  |  MAST        |  Mast Camera                   |
  |  CHEMCAM     |  Chemistry and Camera Complex  |
  |  MAHLI       |  Mars Hand Lens Imager         |
  |  MARDI       |  Mars Descent Imager           |
  |  NAVCAM      |  Navigation Camera             |

The ```Photo``` object has three main attributes: ```sol```, ```camera```, and ```src```. The ```src``` attribute contains the source url of the actual image. In order to display an image in a Rails view for example, I could use:

```ruby
photos = ExploreMars::Call.get(869, "FHAZ")

image_tag(photos.first.src)
```

# Contributing

If you would like to contribute to ExploreMars, feel free to create a pull request. If you'd like to contact me, you can reach me at [chrisccerami@gmail.com](mailto:chrisccerami@gmail.com) or on Twitter [@chrisccerami](https://twitter.com/chrisccerami).
