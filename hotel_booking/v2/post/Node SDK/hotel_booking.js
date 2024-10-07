const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Book a hotel in BLR for 2024-10-10 to 2024-10-12 for 1 guest

    // 1. Hotel List API to get the list of hotels
    const hotelsList = await amadeus.referenceData.locations.hotels.byCity.get({
      cityCode: "BLR",
    });

    // 2. Hotel Search API to get the price and offer id
    const pricingResponse = await amadeus.shopping.hotelOffersSearch.get({
      hotelIds: hotelsList.data[0].hotelId,
      adults: 1,
      checkInDate: "2024-10-10",
      checkOutDate: "2024-10-12",
    });

    // Finally, Hotel Booking API to book the offer
    const response = await amadeus.booking.hotelOrders.post({
      data: {
        type: "hotel-order",
        guests: [
          {
            tid: 1,
            title: "MR",
            firstName: "BOB",
            lastName: "SMITH",
            phone: "+33679278416",
            email: "bob.smith@email.com",
          },
        ],
        travelAgent: {
          contact: {
            email: "bob.smith@email.com",
          },
        },
        roomAssociations: [
          {
            guestReferences: [
              {
                guestReference: "1",
              },
            ],
            hotelOfferId: pricingResponse.data[0].offers[0].id,
          },
        ],
        payment: {
          method: "CREDIT_CARD",
          paymentCard: {
            paymentCardInfo: {
              vendorCode: "VI",
              cardNumber: "4151289722471370",
              expiryDate: "2026-08",
              holderName: "BOB SMITH",
            },
          },
        },
      },
    });
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
