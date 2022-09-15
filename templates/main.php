<!DOCTYPE html>
<html lang = "ru">
<main class = "container">
    <section class = "promo">
        <h2 class = "promo__title">Нужен стафф для катки?</h2>
            <p class = "promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
                <ul class = "promo__list">
                <?php foreach ( $categories as $val ): ?>
                    <li class = "promo__item promo__item--<?= $val['symbol_code']; ?>">
                    <a class = "promo__link" href = "pages/all-lots.html"><?= ht($val); ?></a>
                    </li>
                <?php endforeach;?>
                </ul>
    </section>
    <section class = "lots">
        <div class = "lots__header">
            <h2>Открытые лоты</h2>
        </div>
            <ul class = "lots__list">
            <?php foreach ( $slots as $value ): ?>
                <li class = "lots__item lot">
                    <div class = "lot__image">
                    <img src = "<?= ht($value['image']); ?>" width = "350" height = "260" alt = "">
                    </div>
                    <div class = "lot__info">
                        <span class = "lot__category"><?= ht($value['category']); ?></span>
                            <h3 class = "lot__title"><a class = "text-link" href = "pages/lot.html"><?= ht($value['name']); ?></a></h3>
                                <div class = "lot__state">
                                    <div class = "lot__rate">
                                    <span class = "lot__amount"><?= ht(priceFormat( $value['price_start']) ); ?></span>
                                    <span class = "lot__cost"><?= ht(priceFormat( $value['price']) ); ?></span>
                                    </div>
                                <?php
                                list($diff_hour, $diff_minute) = get_dt_range($value['date_fin']);
                                if ($diff_hour >= 1): ?>
                                    <div class = "lot__timer timer"><?= ht(str_pad($diff_hour, 2, "0", STR_PAD_LEFT) . ":" . ht(str_pad($diff_minute, 2, "0", STR_PAD_LEFT))); ?></div>
                                <?php else: ?>
                                    <div class = "lot__timer timer timer--finishing"><?= (ht(str_pad($diff_hour, 2, "0", STR_PAD_LEFT)) . ":" . ht(str_pad($diff_minute, 2, "0", STR_PAD_LEFT))); ?></div>
                                <?php endif; ?>

                                </div>
                    </div>
                </li>
             <?php endforeach; ?>
             </ul>
    </section>
</main>
</html>
