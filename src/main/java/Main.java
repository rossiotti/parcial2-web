import io.getstream.client.StreamClient;
import io.getstream.client.apache.StreamClientImpl;
import io.getstream.client.config.ClientConfiguration;
import io.getstream.client.exception.InvalidFeedNameException;
import io.getstream.client.exception.StreamClientException;
import io.getstream.client.model.activities.SimpleActivity;
import io.getstream.client.model.feeds.Feed;
import io.getstream.client.model.filters.FeedFilter;
import io.getstream.client.service.FlatActivityServiceImpl;

import java.io.IOException;
import java.util.List;

public class Main {

    public static void main(String[] args) throws StreamClientException, IOException {

        ClientConfiguration streamConfig = new ClientConfiguration();
        StreamClient streamClient = new StreamClientImpl(streamConfig, "h3ra7gfhej4b", "3twqpdteakabmrpv8dpnqanae4j98mrdqgstn5ksdxmwtg5usbx837tptejpdh9m");


        Feed chrisUserFeed = streamClient.newFeed("user", "chris");

// Create an Activity service
        FlatActivityServiceImpl<SimpleActivity> flatActivityService = chrisUserFeed.newFlatActivityService(SimpleActivity.class);

// Add an Activity; message is a custom field - tip: you can add unlimited custom fields!
        SimpleActivity activity = new SimpleActivity();
        activity.setActor("chris");
        activity.setObject("picture:10");
        activity.setVerb("add");
        SimpleActivity response = flatActivityService.addActivity(activity);

// Create a following relationship between Jack's "timeline" feed and Chris' "user" feed:
        Feed jackTimeline = streamClient.newFeed("timeline", "jack");



    }
}