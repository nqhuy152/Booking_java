package booking.DAO;

import booking.model.review;

import java.util.ArrayList;
import java.util.List;

public class reviews {
    private static List<review> reviews = new ArrayList<>();

    public void addReview(review review) {
        reviews.add(review);
    }

    public void clear() {
        reviews.clear();
    }

    public static List<review> getReviews() {
        return reviews;
    }
}
