$(document).on("ready page:load", function() {
  return $(".js-multiple-free-input-select").select2({
    tags: true,
    maximumSelectionLength: 1,
    createTag: function(params) {
      return {
        id: params.term,
        text: params.term,
        newOption: true
      };
    }
  });
});
