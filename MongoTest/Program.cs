﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver;
//using MongoDB.Driver.Builders;
//using MongoDB.Driver.GridFS;
using MongoDB.Driver.Linq;

namespace MongoTest
{
    class Program
    {
        static void Main(string[] args)
        {
            var connectionString = "mongodb+srv://surferjoeuk:surfl3v14th4n@livecluster-4vmcd.mongodb.net/sample_airbnb";
            var client = new MongoClient(connectionString);
            var database = client.GetDatabase("sample_airbnb");

            var collection = database.GetCollection<BsonDocument>("listingsAndReviews");

            var filter = Builders<BsonDocument>.Filter.Eq("_id", 10009999);
            //var documents = collection.Find(new BsonDocument()).ToList();

            var document = collection.Find(filter).First();
            Console.WriteLine(document);
            /*{"_id":"10009999","listing_url":"https://www.airbnb.com/rooms/10009999","name":"Horto flat with small garden","summary":"One bedroom + sofa-bed in quiet and bucolic neighbourhood right next to the Botanical Garden. Small garden, outside shower, well equipped kitchen and bathroom with shower and tub. Easy for transport with many restaurants and basic facilities in the area.","space":"Lovely one bedroom + sofa-bed in the living room, perfect for two but fits up to four comfortably.  There´s a small outside garden with a shower There´s a well equipped open kitchen with both 110V / 220V wall plugs and one bathroom with shower, tub and even a sauna machine! All newly refurbished!","description":"One bedroom + sofa-bed in quiet and bucolic neighbourhood right next to the Botanical Garden. Small garden, outside shower, well equipped kitchen and bathroom with shower and tub. Easy for transport with many restaurants and basic facilities in the area. Lovely one bedroom + sofa-bed in the living room, perfect for two but fits up to four comfortably.  There´s a small outside garden with a shower There´s a well equipped open kitchen with both 110V / 220V wall plugs and one bathroom with shower, tub and even a sauna machine! All newly refurbished! I´ll be happy to help you with any doubts, tips or any other information needed during your stay. This charming ground floor flat is located in Horto, a quiet and bucolic neighborhood just next to the Botanical Garden, where most of the descendants of it´s first gardeners still live. You´ll be 30 minutes walk from waterfalls in the rainforest with easy hiking trails! There are nice bars and restaurants as well as basic facilities - pharmacy, b","neighborhood_overview":"This charming ground floor flat is located in Horto, a quiet and bucolic neighborhood just next to the Botanical Garden, where most of the descendants of it´s first gardeners still live. You´ll be 30 minutes walk from waterfalls in the rainforest with easy hiking trails! There are nice bars and restaurants as well as basic facilities - pharmacy, bakery, small market - in the area.","notes":"There´s a table in the living room now, that does not show in the photos.","transit":"Easy access to transport (bus, taxi, car) and easy free parking around. Very close to Gávea, Leblon, Ipanema, Copacabana and Botafogo.","access":"","interaction":"I´ll be happy to help you with any doubts, tips or any other information needed during your stay.","house_rules":"I just hope the guests treat the space as they´re own, with respect to it as well as to my neighbours! Espero apenas que os hóspedes tratem o lugar com carinho e respeito aos vizinhos!","property_type":"Apartment","room_type":"Entire home/apt","bed_type":"Real Bed","minimum_nights":"2","maximum_nights":"1125","cancellation_policy":"flexible","last_scraped":{"$date":{"$numberLong":"1549861200000"}},"calendar_last_scraped":{"$date":{"$numberLong":"1549861200000"}},"accommodates":{"$numberInt":"4"},"bedrooms":{"$numberInt":"1"},"beds":{"$numberInt":"2"},"number_of_reviews":{"$numberInt":"0"},"bathrooms":{"$numberDecimal":"1.0"},"amenities":["Wifi","Wheelchair accessible","Kitchen","Free parking on premises","Smoking allowed","Hot tub","Buzzer/wireless intercom","Family/kid friendly","Washer","First aid kit","Essentials","Hangers","Hair dryer","Iron","Laptop friendly workspace"],"price":{"$numberDecimal":"317.00"},"weekly_price":{"$numberDecimal":"1492.00"},"monthly_price":{"$numberDecimal":"4849.00"},"cleaning_fee":{"$numberDecimal":"187.00"},"extra_people":{"$numberDecimal":"0.00"},"guests_included":{"$numberDecimal":"1"},"images":{"thumbnail_url":"","medium_url":"","picture_url":"https://a0.muscache.com/im/pictures/5b408b9e-45da-4808-be65-4edc1f29c453.jpg?aki_policy=large","xl_picture_url":""},"host":{"host_id":"1282196","host_url":"https://www.airbnb.com/users/show/1282196","host_name":"Ynaie","host_location":"Rio de Janeiro, State of Rio de Janeiro, Brazil","host_about":"I am an artist and traveling is a major part of my life. I love treating visitors the way I like to be treated when I´m abroad and I'm usually renting my flat while I'm away. I can recommend some cool parties and nights out as well as advise on some hidden secrets of Rio’s nature!","host_thumbnail_url":"https://a0.muscache.com/im/pictures/9681e3cc-4af1-4046-b294-2881dffb4ff8.jpg?aki_policy=profile_small","host_picture_url":"https://a0.muscache.com/im/pictures/9681e3cc-4af1-4046-b294-2881dffb4ff8.jpg?aki_policy=profile_x_medium","host_neighbourhood":"Jardim Botânico","host_is_superhost":false,"host_has_profile_pic":true,"host_identity_verified":false,"host_listings_count":{"$numberInt":"1"},"host_total_listings_count":{"$numberInt":"1"},"host_verifications":["email","phone","facebook"]},"address":{"street":"Rio de Janeiro, Rio de Janeiro, Brazil","suburb":"Jardim Botânico","government_area":"Jardim Botânico","market":"Rio De Janeiro","country":"Brazil","country_code":"BR","location":{"type":"Point","coordinates":[{"$numberDouble":"-43.23074991429229"},{"$numberDouble":"-22.966253551739655"}],"is_location_exact":true}},"availability":{"availability_30":{"$numberInt":"0"},"availability_60":{"$numberInt":"0"},"availability_90":{"$numberInt":"0"},"availability_365":{"$numberInt":"0"}},"review_scores":{},"reviews":[]}*/

           // string a = "b";

        }
    }
}
