$(function() {
  return $('#user_postcode').jpostal({
    postcode: ['#user_postcode'],
    address: {
      '#user_prefecture_code': '%3',
      '#user_address_city': '%4',
      '#user_address_street': '%5%6%7',
    },
  });
});

// ↓模範解答
// $(function () {
//   $(document).on('turbolinks:load', () => {
//     $('#user_postal_code').jpostal({
//       postcode: [
//         '#user_postal_code'
//       ],
//       address: {
//         "#user_prefecture_code": "%3",
//         "#user_city": "%4%5",
//         "#user_street": "%6%7"
//       }
//     });
//   });
// });