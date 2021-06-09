<?php
$data = [
    ['nom' => 'Lloris', 'prénom' => "Hugo", 'equipe' => 'france' ],
    ['nom' => 'Pavard', 'prénom' => "Benjamin", 'equipe' => 'france' ],
    ['nom' => 'Digne', 'prénom' => "Luca", 'equipe' => 'france' ],
    ['nom' => 'Pogba', 'prénom' => "Paul", 'equipe' => 'france' ],
    ['nom' => 'Kanté', 'prénom' => "N'golo'", 'equipe' => 'france' ],
    ['nom' => 'Messi', 'prénom' => "Lionel", 'equipe' => 'argentine' ],
    ['nom' => 'Ronaldo', 'prénom' => "Cristiano", 'equipe' => 'france' ]]
?>
<html>
    <body>
        <?php
        if ($_GET['equipe'] == NULL)
            $pays = "france";
        else
            $pays = $_GET['equipe'];
        ?>
        <h1>Joueurs de l'équipe de <?php echo $pays ?></h1>
        <table border="1">
        <?php foreach ($data as $players) ?>
            <?php foreach ($players as $player) ?>
                <?php if ($player['equipe'] == $pays) ?>
                <tr>
                    <td class="nom"><?php $player['nom'] ?></td>
                    <td class="prenom"><?php $player['prénom'] ?></td>
                </tr>
        </table>
    </body>
</html>
