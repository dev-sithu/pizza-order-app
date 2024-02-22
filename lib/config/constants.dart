const sizeLabels = <String, String>{
  'sm': 'Small',
  'md': 'Medium',
  'lg': 'Large',
};
const crustLabels = <String, String>{
  'thin': 'Thin',
  'thick': 'Thick',
};
const sizes = <String, int>{
  'sm': 10,
  'md': 12,
  'lg': 14,
};
const prices = <String, double>{
  'sm': 8.00,
  'md': 10.00,
  'lg': 12.00,
};
const crusts = <String, double>{
  'thin': 2.00,
  'thick': 4.00,
};
const imageMeta = <String, dynamic>{
  'sm': {
    'img': {
      'radius': 156.0,
      'top': 112,
    },
    'arc': {
      'radius': 176.0,
      'top': 94,
      'diameter': 354,
    },
    'label': {
      'radius': 25.0,
      'bottom': 42,
    },
  },
  'md': {
    'img': {
      'radius': 170.0,
      'top': 103,
    },
    'arc': {
      'radius': 195.0,
      'top': 75,
      'diameter': 385,
    },
    'label': {
      'radius': 25.0,
      'bottom': 29,
    },
  },
  'lg': {
    'img': {
      'radius': 187.0,
      'top': 95,
    },
    'arc': {
      'radius': 200.0,
      'top': 72,
      'diameter': 400,
    },
    'label': {
      'radius': 25.0,
      'bottom': 18,
    },
  },
};

enum Topping { pepperoni, mushroom, olive, sausage, bacon, cheese, pepper, pineapple, spinach, onion }

const ingredients = <Topping, dynamic>{
  Topping.pepperoni: { 'name': 'Pepperoni', 'prize': 0.00 },
  Topping.mushroom: { 'name': 'Mushrooms', 'prize': 0.00 },
  Topping.olive: { 'name': 'Black Olives', 'prize': 0.00 },
  Topping.sausage: { 'name': 'Sausages', 'prize': 0.00 },
  Topping.bacon: { 'name': 'Bacon', 'prize': 0.00 },
  Topping.cheese: { 'name': 'Extra Cheese', 'prize': 0.00 },
  Topping.pepper: { 'name': 'Green Peppers', 'prize': 0.00 },
  Topping.pineapple: { 'name': 'Pineapple', 'prize': 0.00 },
  Topping.spinach: { 'name': 'Spinach', 'prize': 0.00 },
  Topping.onion: { 'name': 'Onions', 'prize': 0.00 },
};
