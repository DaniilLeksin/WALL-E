## WALL-E
![wall-e](https://adoptingjames.files.wordpress.com/2012/05/wall-e1.jpg)
>In the year 2110, rising toxicity levels make life unsustainable on Earth. After all the humans leave Earth aboard giant spaceships, millions of WALL•E robots and a lesser amount of mobile incinerators are left behind to clean up the dirty planet.

## Axiom
![Axiom](https://vignette.wikia.nocookie.net/pixar/images/0/0d/Images3.jpeg/revision/latest?cb=20121127004038)
> The Axiom is one of the countless starliner spacecrafts built by the Buy n Large Corporation (BNL) to evacuate humanity to space while the Earth (that was overwhelmed by trash due to mass consumerism) was cleaned by the BNLs machines, trash compactor robots called WALL•Es and huge mobile incinerators.

## Eve
![Eve](https://vignette.wikia.nocookie.net/pixar/images/c/ca/Eve_wall•e_clipped_rev_1.png/revision/latest?cb=20131115143452)
>EVE is one of several robots who are sent to Earth on a scanning mission. An advanced model equipped with a quasar ion cannon and capable of flight and high speeds.

## Tech Details
The Toy Robot Challenge was originally formulated by [Jon Eaves](https://twitter.com/joneaves)

Thor is used:
```
thor simulator:load_cassette [PATH TO FILE]  # print final position of walle from a list commands from a file
thor simulator:manual_control                # Set orders manually. Use -x -y to set the table params
```

When using `thor simulator:load_cassette [PATH TO FILE]` set `PATH TO FILE` to file in format like:
```
PLACE 0,0,NORTH
MOVE
REPORT
```

You can use example file from `data/` folder

The usage of `thor simulator:manual_control`:
- You can set Table paramters with `-x`, `-y` keys like:
```
thor simulator:manual_control -x 50 -y 50
```

It'll set the table 50x50

Use the tips to manage simulator. Use the rules for Toy Robot Simulator.
