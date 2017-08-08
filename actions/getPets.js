function main(args) {
  return new Promise((resolve, reject) => {
    console.log('GET pets', args);
    resolve({
      pets: [
        {
          "id": 90720,
          "name": "brownie"
        }, {
          "id": 456,
          "name": "doggie"
        }, {
          "id": 1968,
          "name": "Brady"
        }, {
          "id": 654646,
          "name": "doggie"
        }
      ]
    });
  });
}

exports.main = main;
