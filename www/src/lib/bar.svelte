<div>
    latestfollow = {latestfollow==null||undefined ? "null" : `"${latestfollow}"`}; latestsub = {latestsub==null||undefined ? "null" : `"${latestsub}"`};
</div>

<script lang="ts">
    import { latestfollow, latestsub } from "../store"
</script>

<style lang="scss">
    div{
        background-color: #2E3440;
        width: 100%;
        height: 50px;
        text-align: center;
        vertical-align: middle;
        line-height: 50px;
    }
</style>