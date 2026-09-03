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
    tripPlanner: 'Trip Planner',
    moderatorQueue: 'Moderator Queue',
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
    nearbyStays: 'Nearby Stays',
    noStays: 'No verified stays listed yet for this temple.',
    reviews: 'Reviews',
    noReviews: 'No reviews yet. Share your experience below.',
    addReview: 'Add a Review',
    submittedStatusPending: 'This submission is awaiting moderator review.',
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
      photos: 'Photos',
      review: 'Review',
    },
  },

  auth: {
    emailLabel: 'Email',
    passwordLabel: 'Password',
    displayNameLabel: 'Display name',
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

  tripPlanner: {
    title: 'My Trip Planner',
    empty: 'Your trip list is empty. Browse temples and add them here.',
    shareLink: 'Copy shareable link',
    linkCopied: 'Link copied!',
  },
} as const
