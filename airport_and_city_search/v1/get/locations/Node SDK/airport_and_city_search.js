const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_KEY",
});

async function main() {
  try {
    // Retrieve information about the LHR airport?
    const response = await amadeus.referenceData.location("ALHR").get();

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
