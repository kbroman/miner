context("merge_data")

test_that("merge_data works", {

    expect_equal(merge_data("world.getHeight", 5, -200), "world.getHeight(5,-200)")

    expect_equal(merge_data("player.setBlock", -100, 25, 202, 46, 0),
                 "player.setBlock(-100,25,202,46,0)")

})
