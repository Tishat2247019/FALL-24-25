<?php
require_once '../model/usermodel.php';

$wishlist = getWishlist();
?>

<html>
    <head>
        <title>Wishlist</title>
        <link rel="stylesheet" href="../asset/wishlist.css"></link>
    </head>
    <body>
        <form method="POST">
            <table align="center">
                <tr>
                    <td>
                        <fieldset>
                            <legend><h3>Wishlist</h3></legend>
                            <fieldset>
                                <legend>List of Saved Ads</legend>
                                <table>
                                    <?php if (!empty($wishlist)) : ?>
                                        <?php foreach ($wishlist as $ad) : ?>
                                            <tr>
                                                <td><?php echo $ad['ad_title']; ?></td>
                                                <td>
                                                    <a href="ad_details.php?id=<?php echo $ad['id']; ?>">View Saved Ad Details</a>
                                                </td>
                                                <td>
                                                    <form action="remove_wishlist.php" method="POST" style="display:inline;">
                                                        <input type="hidden" name="ad_id" value="<?php echo $ad['id']; ?>">
                                                        <input type="submit" value="Remove Ad">
                                                    </form>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else : ?>
                                        <tr>
                                            <td colspan="3">Your wishlist is empty.</td>
                                        </tr>
                                    <?php endif; ?>
                                </table>
                            </fieldset>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>