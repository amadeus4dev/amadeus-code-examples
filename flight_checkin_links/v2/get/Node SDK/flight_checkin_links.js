const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What is the URL to my online check-in?
    const response = await amadeus.referenceData.urls.checkinLinks.get({
      airlineCode: "BA",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
