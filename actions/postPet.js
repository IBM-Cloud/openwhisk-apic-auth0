function main(args) {
  return new Promise((resolve, reject) => {
    console.log('POST pet', args);
    resolve({
      id: Date.now(),
      name: args.name
    });
  });
}

exports.main = main;
