// Central string table. English-only for v1, but keeping all user-facing
// copy in one place means adding a locale later is a matter of swapping
// this file rather than hunting through components.

export const strings = {
  appName: 'Ṛtam',
  tagline:
    'From the Jyotirlingas to your nearest village temple — find places that support daily rituals, food, and stay.',

  nav: {
    home: 'Home',
    addTemple: 'Add a Temple',
    festivals: 'Festivals',
    circuits: 'Circuits',
    tripPlanner: 'Trip Planner',
    moderatorQueue: 'Moderator Queue',
    adminUsers: 'Manage Users',
    contributors: 'Contributors',
    profile: 'Profile',
    login: 'Log In',
    signup: 'Sign Up',
    logout: 'Log Out',
  },

  search: {
    placeholder: 'Search by temple name, deity, or location…',
    noResults: 'No temples match your search yet. Try widening your filters, or add one yourself.',
    mapView: 'Map view',
    listView: 'List view',
    filters: {
      title: 'Filters',
      state: 'State',
      sandhyaFriendly: 'Sandhya-friendly',
      samidhadhanamFriendly: 'Samidhadhanam-friendly',
      foodTier: 'Food availability',
      hasRiver: 'Has a nearby river',
      any: 'Any',
      clear: 'Clear filters',
    },
  },

  temple: {
    addToTrip: 'Add to my trip list',
    removeFromTrip: 'Remove from trip list',
    inTrip: 'In your trip list',
    photos: 'Photos',
    noPhotos: 'No photos yet — be the first to add one.',
    sthalaPurana: 'Sthala Puranam',
    sthalaPuranaNote:
      'Told as tradition records it. If your family or region knows a different account, please add it.',
    etiquette: 'Before You Go',
    nearbyStays: 'Nearby Stays',
    noStays: 'No verified stays listed yet for this temple.',
    addStay: 'Add a stay',
    reviews: 'Reviews',
    noReviews: 'No reviews yet. Share your experience below.',
    addReview: 'Add a Review',
    nearbyTemples: 'Temples Nearby',
    submittedStatusPending: 'This submission is awaiting moderator review.',
    submittedStatusRejected: 'A moderator asked for changes — see the note below, then edit and resubmit.',
    editAndResubmit: 'Edit & resubmit',
  },

  form: {
    submitTemple: 'Submit Temple',
    savingDraft: 'Saving…',
    submitSuccessTitle: 'Thank you!',
    submitSuccessBody:
      'Your submission is awaiting review by a moderator. It will appear in search once approved.',
    required: 'Required',
    steps: {
      basics: 'Basics',
      rituals: 'Rituals',
      food: 'Food & Stay',
      practical: 'Practical Info',
      photos: 'Photos',
      review: 'Review',
    },
  },

  auth: {
    emailLabel: 'Email',
    passwordLabel: 'Password',
    displayNameLabel: 'Display name',
    usernameLabel: 'Username',
    homeCityLabel: 'Home city (optional)',
    loginTitle: 'Log in to Ṛtam',
    signupTitle: 'Create your Ṛtam account',
    loginCta: 'Log In',
    signupCta: 'Create Account',
    noAccount: "Don't have an account?",
    hasAccount: 'Already have an account?',
  },

  moderator: {
    title: 'Moderator Queue',
    empty: 'No pending submissions right now.',
    approve: 'Approve',
    reject: 'Reject',
    editThenApprove: 'Edit & Approve',
    feedbackPlaceholder: 'Optional feedback note for the contributor…',
  },

  contributors: {
    title: 'Contributors',
    subtitle:
      'Ṛtam is built entirely by the people who walk these paths. Every temple here was added by someone below.',
    empty: 'No contributions yet — be the first.',
    points: 'points',
    templesAdded: 'temples added',
    howPointsWork:
      'Points are awarded automatically: 25 for each temple accepted, 10 for an accepted edit, 5 per photo, 3 per review, 1 per live status check-in.',
    joinedPrompt: 'Add a temple nobody has listed yet',
  },

  tripPlanner: {
    title: 'My Trip Planner',
    empty: 'Your trip list is empty. Browse temples and add them here.',
    shareLink: 'Copy shareable link',
    linkCopied: 'Link copied!',
  },

  circuits: {
    title: 'Pilgrimage Circuits',
    subtitle:
      'Named groups of temples traditionally visited together — browse a circuit, see it on the map, and add the whole thing to your trip in one go.',
    addAllToTrip: 'Add all to my trip',
    addedToTrip: 'circuit added to your trip.',
    viewTrip: 'View my trip',
    complete: 'Complete',
    incomplete: 'temples listed so far',
    notFound: "We don't have a circuit by that name yet.",
    backToCircuits: '← All circuits',
  },
} as const
