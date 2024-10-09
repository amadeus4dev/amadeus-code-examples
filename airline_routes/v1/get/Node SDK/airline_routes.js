const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_AMADEUS_API_KEY",
  clientSecret: "YOUR_AMADEUS_API_SECRET",
});
// Or `const amadeus = new Amadeus()` if the environment variables are set

async function main() {
  try {
    // What are the destinations served by the British Airways (BA)?
    const response = await amadeus.airline.destinations.get({
      airlineCode: "BA",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
