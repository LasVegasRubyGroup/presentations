'use strict';

angular.module('ngCorsApp')
  .factory('product', function () {
    // Service logic
    // ...

    var productData = {
      title: 'Zumo Robot',
      price: 99.95,
      blurb: 'The Pololu Zumo robot is an Arduino-controllable tracked robot platform that is less than 10 cm × 10 cm—small enough to qualify for Mini Sumo. It includes two micro metal gearmotors coupled to a pair of silicone tracks, a stainless steel bulldozer-style blade, an array of six infrared reflectance sensors for line following or edge detection, a 3-axis accelerometer and magnetometer, and a buzzer for simple sounds and music. Just add 4 AA batteries and an Arduino (or compatible controller) and you are ready to push! No soldering or assembly is required.',
      description: 'The Zumo robot is a low-profile tracked robot platform intended for use with an Arduino (or compatible device) as its main controller. It measures less than 10 cm on each side and weighs approximately 300 g with an Arduino Uno and batteries (165 g without, as shipped), so it is both small enough and light enough to qualify for Mini-Sumo competitions. It uses two 75:1 HP micro metal gearmotors to drive the treads, providing plenty of torque and a top speed of approximately 2 feet per second (60 cm/s), which makes it much more agile than competing robots like the Solarbotics Sumovore and Parallax SumoBot while still offering plenty of control. The Zumo robot includes a 0.036"-thick laser-cut stainless steel sumo blade mounted to the front of the chassis for pushing around objects like other robots, and a reflectance sensor array mounted along the front edge of the Zumo (behind the sumo blade) allows the Zumo to detect features on the ground in front of it, such as lines for following or edges for avoiding. The Zumo control board is essentially a shield for the Arduino Uno or Leonardo, both of which can be plugged directly into the shield’s male header pins, face down. (It is not compatible with the Arduino Mega or Due, but it can be used with older Arduinos that have the same form factor as the Uno, such as the Duemilanove.) The shield includes dual motor drivers, a buzzer for playing simple sounds and music, a user pushbutton, and a 3-axis accelerometer and compass. It also boosts the battery voltage to power the Arduino and breaks out the Arduino I/O lines, reset button, and user LED for convenient access and to accommodate additional sensors. Our Zumo Arduino libraries make it easy to interface with all of the integrated hardware, and we provide a number of sample programs that show how to use the Zumo’s reflectance array, pushbutton, buzzer, and motors. We have also written a basic LSM303 Arduino library that makes it easier to interface the LSM303DLHC 3-axis accelerometer and magnetometer with an Arduino. The robot ships as shown in the main product picture; no assembly or soldering is required. An appropriate Arduino (or compatible controller) and four AA batteries are required but not included.',
      specs: '98mm × 98mm × 39mm',
      pictures: 'Here would be some pictures',
      resources: 'Pololu Zumo Shield for Arduino User’s Guide (Printable PDF: zumo_shield_for_arduino.pdf) User’s manual for the Pololu Zumo Shield for Arduino.',
      faqs: {question: 'is it awesome?', answer: 'yes'}
    };

    // Public API here
    return {
      data: function () {
        return productData;
      }
    };
  });
